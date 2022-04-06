from IPython.core.magic import cell_magic, Magics, magics_class
from IPython import get_ipython
from IPython.display import display, HTML
from IPython.display import display_javascript

from ..Program import Program
from ..Program import Lang
import tempfile, os

class _DataHolder:
    """Wrapper class for accessing the local variables in the user
    namespace

    """
    pass

@magics_class
class Magic(Magics):
    """An iPython Magics class for compiling RISC-V source inside of a
    Jupyter Notebook.

    To run a Magic from inside Jupyter Notebooks import Magic
    and use the two magics: %%riscvc (for C Source) and %%riscvasm
    (for RISC-V Assembly) and %%riscvcpp (for C++ Source)

    """
    def name2obj(self, name):
        """Query the local namespace with a name and return an object with
        that name (if it exists)

        Parameters
        ----------
        name: str
            Object name to query the local namespace for

        """
        _proxy = _DataHolder()
        exec('_proxy.obj = {}'.format(name), locals(), self.shell.user_ns)
        return _proxy.obj
    
    @cell_magic
    def riscvc(self, line, cell):
        """Compile a iPython/Jupyter Notebooks cell with C source and return a
        Program representing its compilation.

        Parameters
        ----------
        line: str
            First line of a magics cell. The line should contain the
            name of the program to add to the namespace, and the
            target processor object in the local namespace

        cell: str
            string representation of the RISC-V source in a
            iPython/Jupyter Notebook cell following the first line

        """
        try:
            program_name, processor_name = line.split(' ')
        except:
            return HTML('<pre>Usage: %%riscvc program_name processor_name')

        src_name = f'{program_name}.c'

        return self.__build(src_name, program_name, processor_name, Lang.C, cell)

    @cell_magic
    def riscvasm(self, line, cell):
        """Compile a iPython/Jupyter Notebooks cell with Assembly source and return a
        Program representing its compilation.

        Parameters
        ----------
        line: str
            First line of a magics cell. The line should contain the
            name of the program to add to the namespace, and the
            target processor object in the local namespace

        cell: str
            string representation of the RISC-V source in a
            iPython/Jupyter Notebook cell following the first line

        """
        try:
            program_name, processor_name = line.split(' ')
        except:
            return HTML('<pre>Usage: %%riscvasm program_name processor_name')

        src_name = f'{program_name}.S'

        return self.__build(src_name, program_name, processor_name, Lang.ASM, cell)

    @cell_magic
    def riscvcpp(self, line, cell):
        """Compile a iPython/Jupyter Notebooks cell with C++ source and return
        a Program representing its compilation.

        Parameters
        ----------
        line: str
            First line of a magics cell. The line should contain the
            name of the program to add to the namespace, and the name of
            the processor in the namespace

        cell: str
            string representation of the RISC-V source in a
            iPython/Jupyter Notebook cell following the first line

        """
        try:
            program_name, processor_name = line.split(' ')
        except:
            return HTML('<pre>Usage: %%riscvcpp program_name processor_name')

        src_name = f'{program_name}.cpp'

        return self.__build(src_name, program_name, processor_name, Lang.CPP, cell)

    def __build(self, src_name, program_name, processor_name, lang, cell):
        tempdir = tempfile.mkdtemp()
        with open(os.path.join(tempdir, src_name), 'w') as f:
            f.write(cell)

        try:
            processor = self.name2obj(processor_name)
        except KeyError:
            raise RuntimeError(f'Could not find variable {processor_name} in'
                               ' namespace')
        try:
            program = Program(tempdir, program_name, lang)
            program.build(processor)
        except RuntimeError as r:
            return HTML('<pre>Compilation of program {} FAILED\n {} </pre>'
                        .format(program_name, r.args[0]))
        self.shell.user_ns.update({program_name: program})
        return HTML('<pre>Compilation of program {} SUCCEEDED</pre>'
                    .format(program_name))

jsc = '''
require(['notebook/js/codecell'], function(codecell) {
  codecell.CodeCell.options_default.highlight_modes['magic_text/x-csrc'] = {'reg':[/^%%riscvc/]};
  Jupyter.notebook.events.one('kernel_ready.Kernel', function(){
      Jupyter.notebook.get_cells().map(function(cell){
          if (cell.cell_type == 'code'){ cell.auto_highlight(); } }) ;
  });
});
'''

jsasm = '''
require(['notebook/js/codecell'], function(codecell) {
  codecell.CodeCell.options_default.highlight_modes['magic_text/x-asmx'] = {'reg':[/^%%riscvasm/]};
  Jupyter.notebook.events.one('kernel_ready.Kernel', function(){
      Jupyter.notebook.get_cells().map(function(cell){
          if (cell.cell_type == 'code'){ cell.auto_highlight(); } }) ;
  });
});
'''

jscpp = '''
require(['notebook/js/codecell'], function(codecell) {
  codecell.CodeCell.options_default.highlight_modes['magic_text/x-c++src'] = {'reg':[/^%%riscvcpp/]};
  Jupyter.notebook.events.one('kernel_ready.Kernel', function(){
      Jupyter.notebook.get_cells().map(function(cell){
          if (cell.cell_type == 'code'){ cell.auto_highlight(); } }) ;
  });
});
'''

instance = get_ipython()

if instance:
    instance.register_magics(Magic)
    display_javascript(jsasm, raw=True)
    display_javascript(jsc, raw=True)
    display_javascript(jscpp, raw=True)
    

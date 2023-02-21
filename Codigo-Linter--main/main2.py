import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
import os

class MyWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Syntax Error Checker")

        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        self.add(vbox)

        # Add label for input prompt
        label = Gtk.Label("Enter the name of the shell script file:")
        vbox.pack_start(label, True, True, 0)

        # Add text input field
        self.textbox = Gtk.Entry()
        vbox.pack_start(self.textbox, True, True, 0)

        # Add button to trigger syntax checking
        button = Gtk.Button(label="Check Syntax")
        button.connect("clicked", self.on_button_clicked)
        vbox.pack_start(button, True, True, 0)

    def on_button_clicked(self, widget):
        file_name = self.textbox.get_text()
        if os.path.exists(file_name):
            os.environ['FILE_NAAM'] = file_name
            file_contents = os.popen(f"sed '/^#/d' '{file_name}'").read()
            os.environ['FILE'] = file_contents
            os.system('./for.sh')
            os.system('./if.sh')
            os.system('./while.sh')
            os.system('./check_case_conditional.sh')
            os.system('./check_quotes.sh')
        else:
            print("File not found: ", file_name)

win = MyWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()

import os
import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk


class SyntaxErrorChecker(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Syntax Error Checker")

        # Define the layout
        self.layout = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        self.set_default_size(1000, 900)
        self.add(self.layout)
        self.set_border_width(10)
       

        # Create the banner label
        banner_label = Gtk.Label()
        banner_label.set_markup(
            '<span size="xx-large"><b>     __   __   __     __   __                 ___  ___  __  </b></span>\n'
            '<span size="xx-large"><b>    /  ` /  \ |  \ | / _` /  \    |    | |\ |  |  |__  |__) </b></span>\n'
            '<span size="xx-large"><b>    \__, \__/ |__/ | \__> \__/    |___ | | \|  |  |___ |  \ </b></span>'
        )
        self.layout.pack_start(banner_label, False, False, 0)

        # Create the button and label
        self.check_button = Gtk.Button(label="Check for Syntax Error")
        # self.set_margin_bottom = 1
        # self.check_button = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        self.check_button.connect("clicked", self.on_check_button_clicked)
        
        self.layout.pack_start(self.check_button, True, True, 0)

        self.result_label = Gtk.Label(label="")
        self.layout.pack_start(self.result_label, False, False, 0)

    def on_check_button_clicked(self, button):
        # Get the name of the shell script file
        dialog = Gtk.FileChooserDialog(
            "Please choose a file", self, Gtk.FileChooserAction.OPEN, (Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL, Gtk.STOCK_OPEN, Gtk.ResponseType.OK)
        )
        response = dialog.run()
        if response == Gtk.ResponseType.OK:
            filename = dialog.get_filename()
            dialog.destroy()
        else:
            dialog.destroy()
            return

        # Check for syntax errors
        os.environ["FILE_NAAM"] = filename
        # os.system("./main.sh")
        if os.path.exists(filename):
            os.environ['FILE_NAAM'] = filename
            file_contents = os.popen(f"sed '/^#/d' '{filename}'").read()
            os.environ['FILE'] = file_contents
            os.system('./for.sh')
            os.system('./if.sh')
            os.system('./while.sh')
            os.system('./check_case_conditional.sh')
            os.system('./check_quotes.sh')
        else:
            print("File not found: ", filename)

        # Display the result
        with open("result.txt", "r") as f:
            result = f.read()
        self.result_label.set_label(result)


win = SyntaxErrorChecker()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()

import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
import os

# class MyWindow(Gtk.Window):

#     def __init__(self):
#         Gtk.Window.__init__(self, title="Syntax Error Checker")

#         vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
#         self.add(vbox)

#         # Add label for input prompt
#         label = Gtk.Label("Enter the name of the shell script file:")
#         vbox.pack_start(label, True, True, 0)

#         # Add text input field
#         self.textbox = Gtk.Entry()
#         vbox.pack_start(self.textbox, True, True, 0)

#         # Add button to trigger syntax checking
#         button = Gtk.Button(label="Check Syntax")
#         button.connect("clicked", self.on_button_clicked)
#         vbox.pack_start(button, True, True, 0)

#     def on_button_clicked(self, widget):
#         filename = self.textbox.get_text()
#         if os.path.exists(filename):
#             os.environ['FILE_NAAM'] = filename
#             file_contents = os.popen(f"sed '/^#/d' '{filename}'").read()
#             os.environ['FILE'] = file_contents
#             os.system('./for.sh')
#             os.system('./if.sh')
#             os.system('./while.sh')
#             os.system('./check_case_conditional.sh')
#             os.system('./check_quotes.sh')
#         else:
#             print("File not found: ", filename)

# win = MyWindow()
# win.connect("destroy", Gtk.main_quit)
# win.show_all()
# Gtk.main()


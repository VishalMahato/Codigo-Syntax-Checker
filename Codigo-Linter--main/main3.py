import gi
# prereq
# sudo apt-get install libpango1.0-dev

gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk ,Pango
import os

class MyWindow(Gtk.Window):

    def __init__(self):
                # Define the layout
        super().__init__(title="Syntax Error Checker")
        self.layout = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        self.set_default_size(1000, 900)
        self.add(self.layout)
        self.set_border_width(10)
        self.override_background_color(Gtk.StateType.NORMAL, Gdk.RGBA(1, 1, 1, 1)) # Setting background color

        # Create the banner label
        banner_label = Gtk.Label()
        banner_label.set_markup(
        '<span foreground="#ff0000" size="50000"><b> CODIGO SYNTAX CHECKER </b></span>\n'

        )
        # banner_label.set_markup(
        #     '<span foreground="#ff0000" size="50000"><b>     __   __   __     __   __                 ___  ___  __  </b></span>\n'
        #     '<span foreground="#ff0000" size="50000"><b>    /  ` /  \ |  \ | / _` /  \    |    | |\ |  |  |__  |__) </b></span>\n'
        #     '<span foreground="#ff0000" size="50000"><b>    \__, \__/ |__/ | \__> \__/    |___ | | \|  |  |___ |  \ </b></span>'
        # )

        banner_label.set_margin_top(50) # Setting margin
        # style_context = banner_label.get_style_context()
        # style_context.add_class("banner-label")
        # style_context.get_background_color(Gtk.StateFlags.NORMAL).parse("red")

        self.layout.pack_start(banner_label, False, False, 0)

        # Create the button and label
        self.check_button = Gtk.Button(label="Check for Syntax Error")
        # self.check_button.override_background_color(Gtk.StateType.NORMAL, Gdk.RGBA(0.2, 0.6, 0.8, 1)) # Setting background color
        self.check_button.override_color(Gtk.StateType.NORMAL, Gdk.RGBA(0, 1, 0.5, 1)) # Setting text color
        self.check_button.override_font(Pango.FontDescription('sans 12')) # Setting font
        self.check_button.set_size_request(50, 50)  # set the size of the button
        # self.check_button.override_background_color(Gtk.StateFlags.NORMAL, Gdk.RGBA(1.0, 0.5, 0.0, 1.0))  # set the background color to orange
        style_context = self.check_button.get_style_context()
        style_context.add_class("banner-label")
        style_context.get_background_color(Gtk.StateFlags.NORMAL).parse("red")
        self.check_button.set_margin_top(40) # Setting margin
        # self.check_button.set_margin_top(10)
        self.check_button.set_margin_bottom(10)
        self.check_button.connect("clicked", self.on_check_button_clicked)
        self.layout.pack_start(self.check_button, False,False, 0)
        
        # self.check_button = Gtk.Button(label="Check for Syntax Error")

        # self.check_button.connect("clicked", self.on_check_button_clicked)

        # self.layout.pack_start(self.check_button, True, True, 0)

        self.result_label = Gtk.Label(label="")
        self.result_label.override_font(Pango.FontDescription('sans 12')) # Setting font
        self.layout.pack_start(self.result_label, True, True, 0)
        self.result_label.set_margin_top(10)

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

        markup = f'<span size="large" weight="bold" foreground="blue">{result.upper()}</span>'
        self.result_label.set_markup(markup)




win = MyWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()

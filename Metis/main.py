import kivy
kivy.require('1.0.6')

from kivy.app import App
from kivy.uix.screenmanager import ScreenManager, Screen, FadeTransition
from kivy.uix.gridlayout import GridLayout
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput
from kivy.uix.image import Image

class StartScreen(GridLayout):
    pass

# class LoginScreen(GridLayout):
    
#     def __init__(self, **kwargs):
#         super(LoginScreen, self).__init__(**kwargs)
        # self.cols = 2
        # self.add_widget(Label(text='User Name'))
        # self.name = TextInput(multiline=False)
        # self.add_widget(self.name)
        # self.add_widget(Label(text='Password'))
        # self.password = TextInput(password=True,multiline=False)
        # self.add_widget(self.password)
        # self.add_widget(Button(text='Exit'))
        # self.add_widget(Button(text='Login'))

class MyApp(App):
    def build(self):
        return StartScreen()

if __name__ == '__main__':
    MyApp().run()

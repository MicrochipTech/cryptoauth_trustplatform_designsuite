from PyQt5.QtWidgets import QLabel
from PyQt5.QtCore import pyqtSignal

class QLabel_clickable(QLabel):
    clicked=pyqtSignal()
    def __init__(self, parent=None):
        QLabel.__init__(self, parent)

    def mousePressEvent(self, ev):
        self.clicked.emit()
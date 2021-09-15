import tkinter as tk
from tkinter.filedialog import askopenfilename, asksaveasfilename
import re

keywords = ["public","class","static","void","int","if","else","return"]

def open_file():
    """Open a file for editing."""
    filepath = askopenfilename(
        filetypes=[("Text Files", "*.txt"), ("All Files", "*.*")]
    )
    if not filepath:
        return
    txt_edit.delete(1.0, tk.END)
    with open(filepath, "r") as input_file:
        text = input_file.read()
        txt_edit.insert(tk.END, text)
    window.title(f"Simple Text Editor - {filepath}")

def save_file():
    """Save the current file as a new file."""
    filepath = asksaveasfilename(
        defaultextension="txt",
        filetypes=[("Text Files", "*.txt"), ("All Files", "*.*")],
    )
    if not filepath:
        return
    with open(filepath, "w") as output_file:
        text = txt_edit.get(1.0, tk.END)
        output_file.write(text)
    window.title(f"Simple Text Editor - {filepath}")

def print_html():
    """Print html"""
    text = txt_edit.get(1.0, tk.END)
    # single line comment (\/\*.+\*\/)
    # multi-line line comment (\/*.+)|(.+*\/)
    regex = r"(\/*.+)|(.+*\/)" 
    new_text = []
    enteredMatches = False
    for line in text.split("\n"):
        line_text = []

        matches = re.finditer(regex, line, re.MULTILINE)
        for word in line.split(" "):
            if word in keywords:
                line_text.append('<span class="keyword">' + word + '</span>')
            else:
                line_text.append(word)

        for match in matches:
            line_text.append('<span class="comment">' + match.group() + '</span>')
            enteredMatches = True

        if enteredMatches:
            enteredMatches = False
            new_text.append(' '.join(line_text))
            continue

        new_text.append(' '.join(line_text))
    new_text = '\n'.join(new_text)

    print(new_text)

window = tk.Tk()
window.title("Simple Text Editor")
window.rowconfigure(0, minsize=800, weight=1)
window.columnconfigure(1, minsize=800, weight=1)

txt_edit = tk.Text(window)
fr_buttons = tk.Frame(window, relief=tk.RAISED, bd=2)
btn_open = tk.Button(fr_buttons, text="Open", command=open_file)
btn_save = tk.Button(fr_buttons, text="Save As...", command=save_file)
btn_print_html = tk.Button(fr_buttons, text="Print as html", command=print_html)

btn_open.grid(row=0, column=0, sticky="ew", padx=5, pady=5)
btn_save.grid(row=1, column=0, sticky="ew", padx=5)
btn_print_html.grid(row=2, column=0, sticky="ew", padx=5)

fr_buttons.grid(row=0, column=0, sticky="ns")
txt_edit.grid(row=0, column=1, sticky="nsew")

window.mainloop()
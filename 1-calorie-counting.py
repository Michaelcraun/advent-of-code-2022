from utilities import files, path

def total_calories_per_elf():
    puzzle_input = path.project_path('puzzle_input', '1-calorie-counting.txt')
    lines = files.lines_from_file('1-calorie-counting.py')
    print(lines)

if __name__ == '__main__':
    total_calories_per_elf()

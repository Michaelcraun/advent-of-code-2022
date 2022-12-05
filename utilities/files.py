def lines_from_file(file: str, delete_fetched: bool = False):
    '''
    Extracts the text from a file as a list of lines.

    Parameters
    ----------
    file: str
        The absolute path to the file to extract.

    delete_fetched: bool = False
        If True, removes all lines currently in the file.
    '''

    lines = []
    with open(file, 'r', encoding='utf8') as file_in:
        temp_lines = file_in.readlines()
        with open(file, 'w', encoding='utf8') as file_out:
            for line in temp_lines:
                # Always preserve all comments and empty lines when fetching commands from a file:
                if '#' in line or line == '\n':
                    file_out.write(line)
                    lines.append(line.replace('\n', ''))
                elif not delete_fetched:
                    lines.append(line.replace('\n', ''))
                    file_out.write(line)
                elif delete_fetched:
                    lines.append(line.replace('\n', ''))
                # Otherwise, the line is unhandled; log the line that was encountered and keep
                # it in the file
                else:
                    print(f'Line from {file} not recognized [{line}]')
                    file_out.write(line)
    return lines

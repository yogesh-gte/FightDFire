import os
import glob

search_dir = r'src\main\webapp\WEB-INF\views'
jsp_files = glob.glob(os.path.join(search_dir, '**', '*.jsp'), recursive=True)

for file in jsp_files:
    with open(file, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        
    new_lines = []
    modified = False
    for line in lines:
        if '> Go Back<' in line or 'Go Back</a>' in line or '<!-- Go Back -->' in line:
            modified = True
            continue
        new_lines.append(line)
        
    if modified:
        with open(file, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)
        print(f'Removed Go Back from: {file}')

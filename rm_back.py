import os
import glob

# Search in src/main/webapp/WEB-INF/views recursively
search_dir = r'src\main\webapp\WEB-INF\views'
jsp_files = glob.glob(os.path.join(search_dir, '**', '*.jsp'), recursive=True)

for file in jsp_files:
    if 'sidebar.jsp' in file:
        continue
    
    with open(file, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        
    new_lines = []
    modified = False
    for line in lines:
        if 'Back to Dashboard' in line:
            # We want to remove the entire line or replace the tag. 
            # Since these are usually single-line <a> or <li><a> elements, skipping the line is easiest.
            # Let's just skip the line.
            modified = True
            continue
        new_lines.append(line)
        
    if modified:
        with open(file, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)
        print(f'Removed Back to Dashboard from: {file}')

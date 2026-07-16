import os
import glob
import re

search_dir = r'src\main\webapp\WEB-INF\views'
jsp_files = glob.glob(os.path.join(search_dir, '**', '*.jsp'), recursive=True)

# Pattern to remove the dashboard-bar div entirely
pattern = re.compile(r'<div\s+class=\"[^\"]*dashboard-bar[^\"]*\".*?>\s*<a\s+href=\"[^\"]*/users/dashboard\"[^>]*>.*?</a>\s*</div>', re.IGNORECASE | re.DOTALL)

for file in jsp_files:
    if 'sidebar.jsp' in file:
        continue
        
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
        
    if pattern.search(content):
        new_content = pattern.sub('', content)
        with open(file, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f'Removed dashboard-bar from: {file}')

# Also handle cases where there is no wrapper div, just the link
pattern2 = re.compile(r'<a\s+href=\"[^\"]*/users/dashboard\"\s+class=\"dashboard-btn\">\s*Dashboard.*?</a>', re.IGNORECASE | re.DOTALL)

for file in jsp_files:
    if 'sidebar.jsp' in file:
        continue
        
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
        
    if pattern2.search(content):
        new_content = pattern2.sub('', content)
        with open(file, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f'Removed standalone dashboard-btn from: {file}')


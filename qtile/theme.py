import os
import subprocess
import json


QTILE_PATH = os.path.join(os.path.expanduser('~'), '.config', 'qtile')
DEFAULT_THEME = 'material-darker'


def load_theme():
    config_file = os.path.join(QTILE_PATH, 'config.json')
    if os.path.isfile(config_file):
        with open(config_file) as f:
            theme = json.load(f).get('theme', DEFAULT_THEME)
    else:
        with open(config_file, 'w') as f:
            f.write(f'{json.dumps(dict(theme=DEFAULT_THEME))}\n')
        theme = DEFAULT_THEME
            
            
    theme_file = os.path.join(QTILE_PATH, 'themes', f'{theme}.json')
    
    if not os.path.isfile(theme_file):
        raise Exception(f'{str(theme_file)} does not exists')
    
    with open(theme_file) as f:
        return json.load(f)


colors = load_theme()

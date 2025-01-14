// app/javascript/packs/application.js
import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import '../channels';  // 正しい相対パスを指定

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import './validation';  // validation.jsをインポート

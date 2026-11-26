![version](https://img.shields.io/badge/version-21%20R5-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-arm%20|%20mac-intel%20|%20win-64&color=blue)

# DEMO_21_R5_FormObjects

[日本語](#日本語) | [English](#english)

---

## 日本語

4D 21 R5 で追加された、フォームオブジェクトの境界線と背景のプロパティを紹介するデモです。ボタン・入力・リストボックスのスタイルを、画像を使わずに、フォームエディター、CSS、またはコードから設定できます。

題材は小さな受注管理アプリです。注文一覧と注文詳細の 2 つのフォームがあり、テーマパネルで「システム」「角丸システム」「ブルー」「グレー」「オレンジ」を実行中に切り替えられます。パネルには、実際に適用されたコードも表示されます。

UI の言語は OS の言語に従います（日本語または英語）。

### このデモでわかること

- **カスタム境界線のボタン**：背景色・境界線の色・角丸（`Border Custom`、`OBJECT SET CORNER RADIUS`）
- **入力とリストボックスの境界線の色**：文字色とは別に設定できます（`OBJECT SET RGB COLORS` の第 4 引数、`LISTBOX SET GRID COLOR`）。注文詳細では、未入力の必須項目を赤い境界線で示します。
- **macOS Liquid Glass の「システム」と「角丸システム」**の入力スタイル（`Border System Rounded`）
- **CSS クラス**：スタート画面のボタンに、ライトモードとダークモードのルールを `styleSheets.css` で定義しています。
- **XLIFF によるローカライズ**：`:xliff:` 参照と `Localized string`、`SET DATABASE LOCALIZATION`

### はじめかた

1. 4D 21 R5 以降をインストールします（[ダウンロード](https://jp.4d.com/product-download)）。
2. このリポジトリをクローンまたはダウンロードし、`Project/DEMO_21_R5_FormObjects.4DProject` を開きます。
3. スタート画面が開きます。同梱のデータは英語の注文です。**「サンプルデータを作成」**をクリックすると、日本語の注文に作り直せます。

### デモの進めかた

1. **「デモの注文を開く」**で注文一覧を開きます。
2. 右上の **›** でテーマパネルを開き、テーマを切り替えます。ボタン・リストボックスの見た目と、「適用されたコード」が変わります。
3. 注文をダブルクリック（または「編集」）して注文詳細を開きます。「システム」と「角丸システム」で入力欄の違いを比べます。
4. 「顧客」などを空にして「保存」をクリックすると、空の必須項目が赤い境界線になります。
5. デザインモードに戻るには、メニューの「モード」>「デザインモードに戻る」を選びます。スタート画面はメニュー「デモ...」から再表示できます。

### しくみ

- `__start`：スタート画面をワーカーで開きます。既に開いていれば前面に出します。
- `ApplyTheme`：テーマごとに `OBJECT SET BORDER STYLE`・`OBJECT SET RGB COLORS`・`OBJECT SET CORNER RADIUS` を呼び、同じ内容をコードパネルに表示します。読むならこのメソッドです。
- `OpenOrder`：注文詳細をダイアログで開き、閉じたあと一覧を更新します。
- `btnSave`（InputForm）：必須項目を確認し、新しい注文には保存時に注文番号を付けます。

### データを作り直すには

スタート画面の「サンプルデータを作成」が `GenerateData` を呼び、すべての注文を削除して作り直します。データの言語は UI の言語に従います。データはすべて架空のものです。

---

## English

This demo showcases the new border and background properties of form objects in 4D 21 R5. You can style buttons, inputs and list boxes without image assets, from the Form Editor, CSS or code.

The demo is a small order desk app with an order list and an order detail form. A theme panel switches between System, Rounded System, Blue, Grey and Orange at runtime, and shows the code that was applied.

The UI follows the OS language (English or Japanese).

### What it demonstrates

- **Buttons with a custom border style**: background colour, border colour and corner radius (`Border Custom`, `OBJECT SET CORNER RADIUS`).
- **Border colour on inputs and list boxes**, separate from the font colour: the 4th parameter of `OBJECT SET RGB COLORS` and `LISTBOX SET GRID COLOR`. The order detail form uses it to highlight empty required fields.
- **System vs Rounded System** input styles on macOS Liquid Glass (`Border System Rounded`).
- **CSS classes** with light and dark mode rules for the start screen buttons, in `styleSheets.css`.
- **XLIFF localisation**: `:xliff:` references, `Localized string` and `SET DATABASE LOCALIZATION`.

### Requirements

- 4D 21 R5 or later ([download](https://us.4d.com/product-download)).

### Getting started

1. Clone or download this repository and open `Project/DEMO_21_R5_FormObjects.4DProject`.
2. The start screen opens. The bundled data holds English orders. Click **Generate Data** to recreate them in the current UI language.

### Running the demo

1. Click **Open Demo Orders** to open the order list.
2. Click **›** at the top right to open the theme panel, then switch themes. The buttons, the list box and the "Code applied" text change.
3. Double-click an order (or click **Edit**) to open the order details. Compare the inputs under System and Rounded System.
4. Clear a field such as Customer and click **Save**: empty required fields get a red border.
5. To read the code, choose Mode > Return to Design mode. The **Demo...** menu item reopens the start screen.

### How it works

- `__start`: opens the start screen in a worker, or brings it to the front if it is already open.
- `ApplyTheme`: calls `OBJECT SET BORDER STYLE`, `OBJECT SET RGB COLORS` and `OBJECT SET CORNER RADIUS` for each theme, and writes the same code to the code panel. This is the method worth reading.
- `OpenOrder`: opens the order details in a dialog and refreshes the list afterwards.
- `btnSave` (InputForm): checks the required fields and assigns an order number to new orders on save.

### Rebuilding the data

**Generate Data** on the start screen calls `GenerateData`, which deletes all orders and creates them again in the UI language. All data is fictitious.

## References

- [Customize Buttons, Radio Buttons, and Check Boxes with Background and Border Properties](https://blog.4d.com/customize-buttons-radio-buttons-and-check-boxes-with-background-and-border-properties/)
- [Give Your Form Objects the Border Color They Deserve](https://blog.4d.com/give-your-form-objects-the-border-color-they-deserve/)
- [Choose the Right Native Input Style for Your Interface on macOS](https://blog.4d.com/choose-the-right-native-input-style-for-your-interface-on-macos/)

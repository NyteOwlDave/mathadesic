
# Waving Flag Demo

## Stylesheet

- [Open CSS](./waving-flag.css)

``` css

html, body {
    text-align : center;
    margin : 0;
    padding : 0;
    border : 5px solid transparent;
}

.source-code {
    color : mintcream;
    font-family : "Noto Sans Mono", monospace;
    font-size : 18pt;
    max-height : 40%;
    min-height : 40%;
    text-align : left;
    padding : 1.42ch;
    resize : none;
    overflow-x : auto scroll;
    overflow-y : scroll;
}

textarea {
    background : #040442;
    margin  : 0;
    padding : 0;
    width : 80%;
    margin-left : 0;
}

pre {
    background : #044214;
    width : 80%;
    margin-left : 8%;
}

.workspace { --decal : "🗃️";  --title : "🗃️ Workspace";    }
.files     { --decal : "🗂️";  --title : "🗂️ Files";        }
.file      { --decal : "📄";   --title : "📄 File";        }
.folder    { --decal : "📁";   --title : "📁 Folder";      }
.chippy    { --decal : "🦜";   --title : "🦜 Chippy";      }
.pinned    { --decal : "📌";   --title : "📌 Pinned Item"; }
.error     { --decal : "🔴";   --title : "🔴 Error";       }
.smiley    { --decal : "🙂";   --title : "🙂 Smiley Face"; }
.pending   { --decal : "⏲️";   --title : "⏲️ Pending";     }
.system42  { --decal : "😜";   --title : "😜 System 42";   }
.sulu      { --decal : "🤺";   --title : "🤺 Sulu";        }
.add       { --decal : "➕";    --title : "➕ Add";         }
.remove    { --decal : "➖";    --title : "➖ Remove";      }
.upload    { --decal : "📤";   --title : "📤 Upload";      }
.download  { --decal : "📥";   --title : "📥 Download";    }
.load      { --decal : "🔓";   --title : "🔓 Load";        }
.save      { --decal : "🔏";   --title : "🔏 Save";        }
.edit      { --decal : "🖋️";   --title : "🖋️ Edit";        }
.zoom      { --decal : "💠";   --title : "💠 Zoom";        }
.hidden    { display : none; }

.upload:hover,
.download:hover,
.load:hover,
.save:hover,
.edit:hover,
.zoom:hover,
.pinned:hover ,
.error:hover ,
.smiley:hover ,
.pending:hover ,
.system42:hover ,
.sulu:hover ,
.add:hover ,
.remove:hover ,
.workspace:hover ,
.files:hover ,
.file:hover ,
.folder:hover ,
.chippy:hover {
    color : gold;
    text-shadow : 0px 0px 0.5ch midnightblue;
    cursor : pointer;
}
```

---

# Waving Flag Decals

## Table

| Class      | Decal | Title            |
|------------|-------|------------------|
| .workspace | 🗃️    | 🗃️ Workspace    |
| .files     | 🗂️    | 🗂️ Files         |
| .file      | 📄    | 📄 File          |
| .folder    | 📁    | 📁 Folder        |
| .chippy    | 🦜    | 🦜 Chippy        |
| .pinned    | 📌    | 📌 Pinned Item   |
| .error     | 🔴    | 🔴 Error         |
| .smiley    | 🙂    | 🙂 Smiley Face   |
| .pending   | ⏲️    | ⏲️ Pending       |
| .system42  | 😜    | 😜 System 42     |
| .sulu      | 🤺    | 🤺 Sulu          |
| .add       | ➕     | ➕ Add            |
| .remove    | ➖     | ➖ Remove         |
| .upload    | 📤     | 📤 Upload       |
| .download  | 📥     | 📥 Download     |
| .load      | 🔓     | 🔓 Load         |
| .save      | 🔏     | 🔏 Save         |
| .edit      | 🖋️     | 🖋️ Edit         |
| .zoom      | 💠     | 💠 Zoom         |

---




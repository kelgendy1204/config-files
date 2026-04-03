import { App } from "astal/gtk3";
import Keybindings from "./widget/Keybindings";

import "./style/cappuccino.css";

App.start({
    css: "./style/cappuccino.css",
    main() {
        Keybindings();
    },
});

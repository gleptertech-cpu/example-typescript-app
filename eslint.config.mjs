// .mjs so this file can use ESM `import` regardless of the rest of the
// project being plain CommonJS (no "type": "module" in package.json) -
// Node always treats a .mjs file as a module, no extra config needed.
import eslint from "@eslint/js";
import tseslint from "typescript-eslint";

export default tseslint.config(eslint.configs.recommended, ...tseslint.configs.recommended, {
  ignores: ["dist/**", "node_modules/**"],
});

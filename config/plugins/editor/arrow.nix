{
  plugins.arrow = {
    enable = true;

    settings = {
      show_icons = true;
      leader_key = ";";
      buffer_leader_key = "M";
      separate_by_branch = true;
      save_key = "cwd";
      global_bookmarks = false;
      index_keys = "123456789abcdef";
      mappings = {
        toggle = "s";
        open_vertical = "v";
        open_horizontal = "-";
        quit = "q";
        remove = "x";
        edit = "e";
        delete_mode = "d";
        clear_all_items = "C";
        next_item = "]";
        prev_item = "[";
      };
      window = {
        border = "rounded";
      };
      per_buffer_config = {
        lines = 4;
        sort_automatically = true;
      };
    };
  };
}

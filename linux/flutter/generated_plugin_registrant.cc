//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

<<<<<<< HEAD
#include <file_selector_linux/file_selector_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) file_selector_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FileSelectorPlugin");
  file_selector_plugin_register_with_registrar(file_selector_linux_registrar);
=======
#include <modal_progress_hud_nsn/modal_progress_hud_nsn_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) modal_progress_hud_nsn_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ModalProgressHudNsnPlugin");
  modal_progress_hud_nsn_plugin_register_with_registrar(modal_progress_hud_nsn_registrar);
>>>>>>> f4dd799cf1b84c8c87df4333c9d9409fefd92033
}

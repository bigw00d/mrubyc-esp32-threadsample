#include "mrubyc.h"

#include "models/printer.h"
#include "loops/operator1.h"
#include "loops/operator2.h"

#define MEMORY_SIZE (1024*40)

static uint8_t memory_pool[MEMORY_SIZE];

void app_main(void) {
  mrbc_init(memory_pool, MEMORY_SIZE);

  mrbc_create_task( printer, 0 );
  mrbc_create_task( operator1, 0 );
  mrbc_create_task( operator2, 0 );
  mrbc_run();
}

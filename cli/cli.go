// This file suppose to be at root level but is throwing redeclare error
// due to the 'main' function repeated on magento.go app file
package main

import (
	"magento.GO/cmd"
	"magento.GO/config"
)

func main() {
	config.LoadEnv()
	cmd.Execute()
}

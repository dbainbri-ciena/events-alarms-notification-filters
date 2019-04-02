package main

import (
	"fmt"
	"github.com/xeipuuv/gojsonschema"
	"io/ioutil"
	"os"
)

func main() {

	schema, err := os.Open(os.Args[1])
	if err != nil {
		panic(err.Error())
	}
	sample, err := os.Open(os.Args[2])
	if err != nil {
		panic(err.Error())
	}

	schemaLoader, reader := gojsonschema.NewReaderLoader(schema)
	ioutil.ReadAll(reader)
	documentLoader, reader := gojsonschema.NewReaderLoader(sample)
	ioutil.ReadAll(reader)

	result, err := gojsonschema.Validate(schemaLoader, documentLoader)
	if err != nil {
		panic(err.Error())
	}

	if result.Valid() {
		fmt.Printf("The document is valid\n")
	} else {
		fmt.Printf("The document is not valid. see errors :\n")
		for _, desc := range result.Errors() {
			fmt.Printf("- %s\n", desc)
		}
	}
}

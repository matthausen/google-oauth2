package handlers

import (
	"fmt"
	"net/http"
)

func HandleIndex(w http.ResponseWriter, r *http.Request) {
	var htmlIndex = `<html>
		<body>
			<a href="/login">Google Log In</a>
		</body>
		</html>`

	fmt.Fprintf(w, htmlIndex)
}

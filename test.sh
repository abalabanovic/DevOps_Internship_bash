#!/bin/bash

var="TEST"

	if echo "${var}" | sed '/[A-Z]/q'; then

		echo "The string contains uppercase letters"
	fi

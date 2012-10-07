#!/bin/bash
for i in $(ls test*); do ruby $i; done

#!/usr/bin/env bash
# Copyright (C) 2022 Carnegie Mellon University
#
# This file is part of the TCP in the Wild course project developed for the
# Computer Networks course (15-441/641) taught at Carnegie Mellon University.
#
# No part of the project may be copied and/or distributed without the express
# permission of the 15-441/641 course staff.

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo "Preparing submission..."
echo "Make sure to commit all files that you want to submit."

# Check if there are any modified file that has not been committed
if [[ $(git status --porcelain | wc -l) -ne 0 ]]; then
    # Print warning message in yellow
    echo
    echo -e "${YELLOW}WARNING: There are uncommitted modified files. Only committed changes will be added to the archive.${NC}"
fi

cd $SCRIPT_DIR/../..
git archive -o handin.tar.gz HEAD

echo "Upload handin.tar.gz to Gradescope."

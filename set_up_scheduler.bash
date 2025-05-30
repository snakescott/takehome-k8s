#!/bin/bash

# Script to apply Kubernetes configurations sequentially,
# optionally targeting a specific namespace.

# --- Configuration Files ---
SCAFFOLDING_FILE="scaffolding.yaml"
SCHEDULER_FILE="scheduler.yaml"

# --- Check for Namespace Argument ---
NAMESPACE_ARG=""
if [ -n "$1" ]; then
  NAMESPACE_ARG="-n $1"
  echo "Using namespace: $1"
else
  echo "No namespace specified, applying to default namespace."
fi

# --- Helper function to apply a file ---
apply_kubernetes_file() {
  local file_to_apply=$1
  local namespace_option=$2 # This will be either empty or "-n <namespace>"

  echo "--------------------------------------------------"
  echo "Applying $file_to_apply..."
  echo "--------------------------------------------------"

  # Construct the kubectl command
  # The quotes around $namespace_option are important if it's empty,
  # otherwise it would pass an empty string as an argument.
  # We can conditionally add the namespace option.
  if [ -n "$namespace_option" ]; then
    command="kubectl apply $namespace_option -f $file_to_apply"
  else
    command="kubectl apply -f $file_to_apply"
  fi

  echo "Executing: $command"

  # Execute the command
  if $command; then
    echo "$file_to_apply applied successfully."
  else
    echo "Error applying $file_to_apply. Please check the output above."
    # Optional: Exit script if any command fails
    # exit 1
  fi
  echo "" # Add a blank line for better readability
}

# --- Main Execution ---

# Apply scaffolding.yaml
apply_kubernetes_file "$SCAFFOLDING_FILE" "$NAMESPACE_ARG"

# Apply scheduler.yaml
apply_kubernetes_file "$SCHEDULER_FILE" "$NAMESPACE_ARG"

echo "--------------------------------------------------"
echo "All specified Kubernetes configurations have been processed."
echo "--------------------------------------------------"

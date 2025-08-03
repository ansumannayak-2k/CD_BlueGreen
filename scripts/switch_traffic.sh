# scripts/switch_traffic.sh
#!/bin/bash
TARGET=$1
kubectl patch svc myapp-service -p "{\"spec\":{\"selector\":{\"app\":\"myapp-${TARGET}\"}}}"


if [[ "$TARGET" != "blue" && "$TARGET" != "green" ]]; then
  echo "Usage: $1 [blue|green]"
  exit 1
fi

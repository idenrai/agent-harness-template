#!/bin/bash
# Quality Gate: Full Pipeline Verification Script
# Runs Type Check, Lint, Test, and Build sequentially with fail-fast behavior.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
cd "$PROJECT_ROOT"

echo "=================================================="
echo "🚀 [Quality Gate] Starting Full Pipeline Check..."
echo "   Root: $PROJECT_ROOT"
echo "=================================================="

# 1. Type Check (if tsconfig.json exists)
if [ -f "tsconfig.json" ]; then
    echo "🔍 Step 1: Checking TypeScript types (npx tsc --noEmit)..."
    npx tsc --noEmit
    echo "✅ Step 1 Passed: 0 Type Errors"
else
    echo "ℹ️  Step 1 Skipped: No tsconfig.json found"
fi

# 2. Lint Check (if package.json has lint script)
if grep -q '"lint"' package.json 2>/dev/null; then
    echo "🔍 Step 2: Running Linter (npm run lint)..."
    npm run lint
    echo "✅ Step 2 Passed: 0 Lint Errors"
else
    echo "ℹ️  Step 2 Skipped: No lint script found in package.json"
fi

# 3. Tests (if test script exists)
if grep -q '"test"' package.json 2>/dev/null; then
    echo "🔍 Step 3: Running Tests (npm test)..."
    npm test
    echo "✅ Step 3 Passed: Tests completed successfully"
else
    echo "ℹ️  Step 3 Skipped: No test script found in package.json"
fi

# 4. Build (if build script exists)
if grep -q '"build"' package.json 2>/dev/null; then
    echo "🔍 Step 4: Running Production Build (npm run build)..."
    npm run build
    echo "✅ Step 4 Passed: Production Build Succeeded"
else
    echo "ℹ️  Step 4 Skipped: No build script found in package.json"
fi

echo "=================================================="
echo "🎉 [Quality Gate] All available checks passed successfully!"
echo "=================================================="


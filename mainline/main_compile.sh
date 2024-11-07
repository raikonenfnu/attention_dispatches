if [ "$#" -ne 1 ]; then
    echo "Missing input MLIR file"
    exit 1
fi
TD_SPEC=/home/stwinata/nod/mlperf/mainline/new_attn_and_matmul_spec.mlir
~/nod/iree-build-notrace/install/bin/iree-compile \
    --iree-execution-model=async-external \
    --iree-hal-target-backends=rocm \
    --iree-hip-target=gfx942 \
    --iree-hip-waves-per-eu=2 \
    --iree-codegen-gpu-native-math-precision=true \
    --iree-codegen-llvmgpu-use-vector-distribution \
    --iree-codegen-transform-dialect-library= \
    --iree-dispatch-creation-enable-aggressive-fusion=true \
    --iree-global-opt-propagate-transposes=true \
    --iree-llvmgpu-enable-prefetch=true \
    --iree-opt-aggressively-propagate-transposes=true \
    --iree-opt-const-eval=false \
    --iree-opt-outer-dim-concat=true \
    --iree-opt-data-tiling=false \
    --iree-codegen-transform-dialect-library=${TD_SPEC} \
    --iree-preprocessing-pass-pipeline="builtin.module(util.func(iree-global-opt-raise-special-ops, iree-flow-canonicalize), iree-preprocessing-transpose-convolution-pipeline,  iree-preprocessing-pad-to-intrinsics, util.func(iree-preprocessing-generalize-linalg-matmul-experimental))" \
    --iree-hal-benchmark-dispatch-repeat-count=100 \
    --iree-vm-target-truncate-unsupported-floats $1 -o $1.vmfb
    #  --mlir-print-ir-after-all 2> $1.dump
    # --debug-only=iree-codegen-gpu-vector-distribution

    # attention_config.mlir
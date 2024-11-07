# Dispatch 146
~/nod/mlperf/iree-build-mlperf/install/bin/iree-benchmark-module --batch_size=100 --module=mlperf_dispatch146.mlir.vmfb --function="main$async_dispatch_146_attention_2x20x1024x64xf16_genericz" --device=hip --input=2x20x1024x64xf16 --input=2x20x1024x64xf16 --input=2x20x1024x64xf16  --input=20x64xf16 --input=xf32
# 48
# ~/nod/mlperf/iree-build-mlperf/install/bin/iree-benchmark-module --batch_size=100 --module=mlperf_dispatch48.mlir.vmfb --function="main$async_dispatch_146_attention_2x20x1024x64xf16_genericz" --device=hip --input=2x10x4096x64xf16 --input=2x10x4096x64xf16 --input=2x10x4096x64xf16  --input=10x64xf16 --input=xf32

% Define the kernel source code with placeholders for input parameters

kernelSource = ['#include <cuda.h>\n' ...
                'template <int n>\n' ...
                'extern "C" __global__ void vectorAddKernel(float* A, float* B, float* C)\n' ...
                '{\n' ...
                '    int i = threadIdx.x + blockDim.x * blockIdx.x;\n' ...
                '    if (i < n) {\n' ...
                '        C[i] = A[i] + B[i];\n' ...
                '    }\n' ...
                '}'];

% Define the kernel parameters
n = 1024;
numIterations = 10;

% Compile the templated kernel code once outside of the loop
kernelFunction = sprintf(kernelSource, n);
compiledKernel = parallel.gpu.CUDAKernel([], kernelFunction);

% Inside the parfor loop, call the compiled kernel with the necessary arguments
parfor idx = 1:numIterations
    % Call kernel with arguments
    blockSize = [256,1,1]; % block size
    gridSize = [ceil(n/256),1,1]; % grid size
    output{idx} = zeros(n, 1, 'single', 'gpuArray');
    feval(compiledKernel, blockSize, gridSize, {gpuArray(single(rand(n, 1))), gpuArray(single(rand(n, 1))), output{idx}});
end


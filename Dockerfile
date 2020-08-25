FROM mcr.microsoft.com/azurespheresdk AS azsphere-samples-repo

RUN git clone https://github.com/Azure/azure-sphere-samples.git

FROM azsphere-samples-repo AS azsphere-sampleapp-build

RUN mkdir /build
WORKDIR /build

ENV sample=HelloWorld/HelloWorld_HighLevelApp

CMD cmake -G "Ninja" \
-DCMAKE_TOOLCHAIN_FILE="/opt/azurespheresdk/CMakeFiles/AzureSphereToolchain.cmake" \
-DAZURE_SPHERE_TARGET_API_SET="latest-lts" \
-DCMAKE_BUILD_TYPE="Debug" \
/azure-sphere-samples/Samples/${sample} && \
ninja
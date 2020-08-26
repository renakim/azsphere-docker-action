FROM mcr.microsoft.com/azurespheresdk AS azsphere-app-repo

RUN git clone https://github.com/WIZnet-Azure-Sphere/ASG200_App -b sdk-20.07

FROM azsphere-app-repo AS asg200-app-build

RUN mkdir /build
WORKDIR /build

ENV sample=WIZASG200_HLApp_AzureIoT

CMD cmake -G "Ninja" \
-DCMAKE_TOOLCHAIN_FILE="/opt/azurespheresdk/CMakeFiles/AzureSphereToolchain.cmake" \
-DAZURE_SPHERE_TARGET_API_SET="latest-lts" \
-DCMAKE_BUILD_TYPE="Debug" \
/ASG200_App/Software/${sample} && \
ninja

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
FROM mcr.microsoft.com/windows/servercore:ltsc2022

COPY ["scripts", "\\SHIR\\"]

RUN ["powershell", "C:\\SHIR\\build.ps1"]

COPY ["jre-1.8", "\\Java\\"]

ENTRYPOINT ["powershell", "C:\\SHIR\\entrypoint.ps1"]

ENV SHIR_WINDOWS_CONTAINER_ENV True

ENV JAVA_HOME "C:\\Program Files\\Java\\jre-1.8"

HEALTHCHECK --start-period=120s CMD ["powershell", "\\SHIR\\health-check.ps1"]

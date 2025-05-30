FROM alpine:latest
RUN apk --no-cache add ca-certificates python3 py3-pip py3-kubernetes
COPY ./custom-scheduler /usr/local/bin/custom-scheduler
RUN chmod a+x /usr/local/bin/custom-scheduler
ENV PYTHONUNBUFFERED=1
CMD ["/usr/local/bin/custom-scheduler"]

FROM golang:1.11-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]
LABEL maintainer='sophi.nunner@gmail.com'

# Set working directory: `/src`
# sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and
# ADD instructions that follow in the Dockerfile
RUN mkdir /src
WORKDIR /src

# Copy local file `main.go` to the working directory
COPY main.go ./

# List items in the working directory (ls)
RUN ls

# Build the GO app as myapp binary and move it to /usr/
# with -o flag we can specify a subfolder
RUN CGO_ENABLED=0 go build -o /usr/myapp

#Expose port 8888
EXPOSE 8888

# Run the service myapp when a container of this image is launched
CMD ["/usr/myapp"] 
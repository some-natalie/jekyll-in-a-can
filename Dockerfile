FROM cgr.dev/chainguard/ruby:latest-dev

# Labels!
LABEL org.opencontainers.image.source "https://github.com/some-natalie/jekyll-in-a-can"
LABEL org.opencontainers.image.path "Dockerfile"
LABEL org.opencontainers.image.title "Jekyll in a Can"
LABEL org.opencontainers.image.description "Jekyll in a container for local static site development"
LABEL org.opencontainers.image.authors "Natalie Somersall (@some-natalie)"
LABEL org.opencontainers.image.licenses "MIT"
LABEL org.opencontainers.image.documentation https://github.com/some-natalie/jekyll-in-a-can/README.md

# Environment variable for system
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV TZ=America/Denver
ENV LC_ALL=en_US.UTF-8
ENV GEM_HOME=/usr/local/vendor
ENV GEM_PATH=${GEM_PATH}:/usr/local/vendor
ENV PATH=${GEM_HOME}/bin:${PATH}

# Update gems
USER root
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN yes | gem update --system
RUN yes | gem install jekyll bundler
RUN chown -R nonroot:nonroot /usr/local/vendor

# Set the working directory
WORKDIR /work

# Copy in and set the entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Now switch back to the non-root user
USER nonroot

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Expose ports
EXPOSE 35729
EXPOSE 4000

# Run the thing!
CMD ["bundle", "exec", "jekyll", "serve", "--livereload", "--host", "0.0.0.0"]

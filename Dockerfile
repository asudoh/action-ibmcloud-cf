FROM registry.access.redhat.com/rhel7/rhel

COPY manifest.yml storybook-static /

ENTRYPOINT ["/entrypoint.sh"]

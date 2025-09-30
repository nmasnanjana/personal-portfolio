# Use Python 3.11 slim image for smaller size
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy all files to the container
COPY . .

# Expose port 8002
EXPOSE 8002

# Create a startup script
RUN echo '#!/bin/bash\n\
echo "Starting Anjana Narasinghe Portfolio Server..."\n\
echo "Server will be available at: http://localhost:8002"\n\
echo "Press Ctrl+C to stop the server"\n\
python3 -m http.server 8002 --bind 0.0.0.0' > start.sh

# Make the startup script executable
RUN chmod +x start.sh

# Set environment variables
ENV PORT=8002
ENV HOST=0.0.0.0

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8002/ || exit 1

# Run the startup script
CMD ["./start.sh"]

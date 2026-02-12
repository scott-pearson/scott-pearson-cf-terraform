export default {
  async fetch(request, env, ctx) {
    const mimeMap = {
      "js":   "application/javascript",
      "css":  "text/css",
      "json": "application/json",
      "png":  "image/png",
      "jpg":  "image/jpeg",
      "jpeg": "image/jpeg",
      "html": "text/html",
      "svg":  "image/svg+xml"
    };

    let response = await fetch(request);

    if (response.status === 304) {
      const url = new URL(request.url);
      const extension = url.pathname.split('.').pop().toLowerCase();
      const contentType = mimeMap[extension] || "application/octet-stream";

      // Headers are immutable, so we must clone them
      let newHeaders = new Headers(response.headers);
      newHeaders.set("Content-Type", contentType);

      return new Response(null, {
        status: 304,
        statusText: "Not Modified",
        headers: newHeaders
      });
    }

    return response;
  }
};

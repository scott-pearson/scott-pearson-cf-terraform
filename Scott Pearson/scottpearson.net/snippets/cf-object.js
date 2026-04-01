export default {
  async fetch(request) {
    const cf = request.cf;
    return new Response(JSON.stringify(cf, null, 2), {
      headers: { "content-type": "application/json" },
    });
  },
};

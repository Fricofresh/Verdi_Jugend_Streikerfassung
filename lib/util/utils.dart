String createKey(String routeId) => routeId.replaceFirst("/", "").replaceAll("/", "_");

enum APIState {
  init,
  loading,
  error,
  succses,
}

enum CategoryAPIState {
  init,
  loading,
  loadingSubs,
  error,
  errorSubs,
  succses,
}

enum LocalDataKeys {
  token,
  lang,
}

enum ProductAPIState {
  init,
  loading,
  loadingMore,
  loadingMoreError,
  error,
  succses,
}

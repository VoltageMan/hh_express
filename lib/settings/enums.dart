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

enum AddressApiState {
  init,
  loading,
  error,
  succses,
}

enum CartAPIState {
  unAuthorized,
  init,
  loading,
  error,
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

enum ProdDetailsAPIState {
  init,
  loading,
  error,
  succses,
}

enum FilterAPIState {
  init,
  loading,
  error,
  succses,
}

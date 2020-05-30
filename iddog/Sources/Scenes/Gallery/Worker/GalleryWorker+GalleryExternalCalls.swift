import Foundation

protocol GalleryExternalCalls {
    func fetchGalleryData(for category: String, result: @escaping ResultHandler<CategoryGalleryProtocol>)
    func starPrefetchDataSourceOperation(with urls: [URL])
    func cancelPrefethcDataSoucerOperation(with urls: [URL])
}

extension GalleryWorker: GalleryExternalCalls {
    func fetchGalleryData(for category: String, result: @escaping ResultHandler<CategoryGalleryProtocol>) {
        guard let token = credentialStorage.getAccessTokenSync() else {
            return result(.failure(.unauthorized))
        }

        let galleryEndpoint = GalleryEndpoint(
            category: category,
            token: token
        )

        let result: ResultHandler<CategoryGalleryModel> = { response in
            switch response {
            case let .success(credentials):
                result(.success(credentials))
            case let .failure(error):
                result(.failure(error))
            }
        }

        network.performRequest(
            endpoint: galleryEndpoint,
            result: result
        )
    }

    func starPrefetchDataSourceOperation(with urls: [URL]) {
        imageLoaderService.starPrefetchDataSourceOperation(with: urls)
    }

    func cancelPrefethcDataSoucerOperation(with urls: [URL]) {
        imageLoaderService.cancelPrefethcDataSoucerOperation(with: urls)
    }
}

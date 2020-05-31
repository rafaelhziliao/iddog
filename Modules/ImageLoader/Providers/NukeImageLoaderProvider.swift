import Foundation
import Nuke

public final class NukeImageLoaderProvider: ImageLoaderServiceProtocol {
    private let preheater = ImagePreheater()

    public init () {
        configure()
    }

    public func loadImage(with url: URL, result: @escaping ResulImageHandler) {
        let request = ImageRequest(url: url)

        ImagePipeline.shared.loadImage(with: request, queue: nil, progress: nil) { response in
            DispatchQueue.main.async {
                switch response {
                case let .success(imageResponse):
                    result(.success(imageResponse.image))
                case let .failure(error):
                    result(.failure(error))
                }
            }
        }
    }

    private func configure() {
        let contentModes = ImageLoadingOptions.ContentModes(
            success: .scaleAspectFill,
            failure: .scaleAspectFit,
            placeholder: .scaleAspectFit
        )
        ImageLoadingOptions.shared.transition = .fadeIn(duration: 0.5)
        ImageLoadingOptions.shared.contentModes = contentModes
    }

    public func starPrefetchDataSourceOperation(with urls: [URL]) {
        preheater.startPreheating(with: urls)
    }

    public func cancelPrefethcDataSoucerOperation(with urls: [URL]) {
        preheater.stopPreheating(with: urls)
    }

}

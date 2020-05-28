import Foundation
import Nuke

public final class NukeImageLoaderProvider: ImageLoaderServiceProtocol {
    public init () {
        configure()
    }

    public func loadImage(with url: URL, result: @escaping ResulImageHandler) {
        let request = ImageRequest(url: url)

        ImagePipeline.shared.loadImage(with: request, queue: nil, progress: nil) { response in
            switch response {
            case let .success(imageResponse):
                result(.success(imageResponse.image))
            case let .failure(error):
                result(.failure(error))
            }
        }
    }

    private func configure() {
        let contentModes = ImageLoadingOptions.ContentModes(success: .scaleAspectFill,
                                                            failure: .scaleAspectFit,
                                                            placeholder: .scaleAspectFit)
        ImageLoadingOptions.shared.transition = .fadeIn(duration: 0.5)
        ImageLoadingOptions.shared.contentModes = contentModes
    }
}

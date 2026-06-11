

import Foundation

extension SearchLocationDTO {

    func toDomain() -> SearchLocation {

        SearchLocation(
            name: name ?? "",
            latitude: lat ?? 0,
            longitude: lon ?? 0,
            country: country ?? ""
        )
    }
}

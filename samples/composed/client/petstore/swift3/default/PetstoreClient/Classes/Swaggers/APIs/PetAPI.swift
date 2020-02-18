//
// PetAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class PetAPI: APIBase {
    /**
     Add a new parrow to the store
     - parameter body: (body)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addParrot(body: Body2? = nil, completion: @escaping ((_ data: InlineResponse2001?, _ error: ErrorResponse?) -> Void)) {
        addParrotWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Add a new parrow to the store
     - POST /parrot

     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  (optional)
     - returns: RequestBuilder<InlineResponse2001> 
     */
    open class func addParrotWithRequestBuilder(body: Body2? = nil) -> RequestBuilder<InlineResponse2001> {
        let path = "/parrot"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters = body?.encodeToJSON()

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<InlineResponse2001>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Add a new pet to the store
     - parameter body: (body) Pet object that needs to be added to the store 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addPet(body: Pet, completion: @escaping ((_ error: ErrorResponse?) -> Void)) {
        addPetWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(error)
        }
    }


    /**
     Add a new pet to the store
     - POST /pet
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter body: (body) Pet object that needs to be added to the store 
     - returns: RequestBuilder<Void> 
     */
    open class func addPetWithRequestBuilder(body: Pet) -> RequestBuilder<Void> {
        let path = "/pet"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters = body.encodeToJSON()

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Deletes a pet
     - parameter petId: (path) Pet id to delete 
     - parameter apiKey: (header)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deletePet(petId: Int64, apiKey: String? = nil, completion: @escaping ((_ error: ErrorResponse?) -> Void)) {
        deletePetWithRequestBuilder(petId: petId, apiKey: apiKey).execute { (response, error) -> Void in
            completion(error)
        }
    }


    /**
     Deletes a pet
     - DELETE /pet/{petId}
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter petId: (path) Pet id to delete 
     - parameter apiKey: (header)  (optional)
     - returns: RequestBuilder<Void> 
     */
    open class func deletePetWithRequestBuilder(petId: Int64, apiKey: String? = nil) -> RequestBuilder<Void> {
        var path = "/pet/{petId}"
        let petIdPreEscape = "\(petId)"
        let petIdPostEscape = petIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{petId}", with: petIdPostEscape, options: .literal, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)
        let nillableHeaders: [String: Any?] = [
                        "api_key": apiKey
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

    /**
     Find pet by ID
     - parameter body: (body) Pet object that needs to be added to the store 
     - parameter token: (header) status 
     - parameter petType: (query) type of food 
     - parameter status: (query) status 
     - parameter petId: (path) ID of pet to return 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func feedPet(body: Pet, token: String, petType: String, status: String, petId: Int64, completion: @escaping ((_ error: ErrorResponse?) -> Void)) {
        feedPetWithRequestBuilder(body: body, token: token, petType: petType, status: status, petId: petId).execute { (response, error) -> Void in
            completion(error)
        }
    }


    /**
     Find pet by ID
     - POST /pet/feed/{petId}
     - schedule pet feeding

     - parameter body: (body) Pet object that needs to be added to the store 
     - parameter token: (header) status 
     - parameter petType: (query) type of food 
     - parameter status: (query) status 
     - parameter petId: (path) ID of pet to return 
     - returns: RequestBuilder<Void> 
     */
    open class func feedPetWithRequestBuilder(body: Pet, token: String, petType: String, status: String, petId: Int64) -> RequestBuilder<Void> {
        var path = "/pet/feed/{petId}"
        let petIdPreEscape = "\(petId)"
        let petIdPostEscape = petIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{petId}", with: petIdPostEscape, options: .literal, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        let parameters = body.encodeToJSON()
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
                        "petType": petType,
                        "status": status
        ])
        let nillableHeaders: [String: Any?] = [
                        "token": token
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true, headers: headerParameters)
    }

    /**
     * enum for parameter status
     */
    public enum Status_findPetsByStatus: String { 
        case available = "available"
        case pending = "pending"
        case sold = "sold"
    }

    /**
     Finds Pets by status
     - parameter status: (query) Status values that need to be considered for filter 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findPetsByStatus(status: [String], completion: @escaping ((_ data: [Pet]?, _ error: ErrorResponse?) -> Void)) {
        findPetsByStatusWithRequestBuilder(status: status).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Finds Pets by status
     - GET /pet/findByStatus
     - Multiple status values can be provided with comma separated strings
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - examples: [{contentType=application/json, example=[ {
  "part" : [ "", "" ],
  "name" : "doggie",
  "id" : 0,
  "status" : "available"
}, {
  "part" : [ "", "" ],
  "name" : "doggie",
  "id" : 0,
  "status" : "available"
} ]}]
     - parameter status: (query) Status values that need to be considered for filter 
     - returns: RequestBuilder<[Pet]> 
     */
    open class func findPetsByStatusWithRequestBuilder(status: [String]) -> RequestBuilder<[Pet]> {
        let path = "/pet/findByStatus"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
                        "status": status
        ])

        let requestBuilder: RequestBuilder<[Pet]>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Finds Pets by tags
     - parameter tags: (query) Tags to filter by 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findPetsByTags(tags: [String], completion: @escaping ((_ data: [Pet]?, _ error: ErrorResponse?) -> Void)) {
        findPetsByTagsWithRequestBuilder(tags: tags).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Finds Pets by tags
     - GET /pet/findByTags
     - Muliple tags can be provided with comma separated strings. Use\\ \\ tag1, tag2, tag3 for testing.
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - examples: [{contentType=application/json, example=[ {
  "part" : [ "", "" ],
  "name" : "doggie",
  "id" : 0,
  "status" : "available"
}, {
  "part" : [ "", "" ],
  "name" : "doggie",
  "id" : 0,
  "status" : "available"
} ]}]
     - parameter tags: (query) Tags to filter by 
     - returns: RequestBuilder<[Pet]> 
     */
    open class func findPetsByTagsWithRequestBuilder(tags: [String]) -> RequestBuilder<[Pet]> {
        let path = "/pet/findByTags"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
                        "tags": tags
        ])

        let requestBuilder: RequestBuilder<[Pet]>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     get Parrots
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getParrots(completion: @escaping ((_ data: [Object]?, _ error: ErrorResponse?) -> Void)) {
        getParrotsWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     get Parrots
     - GET /parrot

     - examples: [{contentType=application/json, example=[ "", "" ]}]
     - returns: RequestBuilder<[Object]> 
     */
    open class func getParrotsWithRequestBuilder() -> RequestBuilder<[Object]> {
        let path = "/parrot"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[Object]>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Find pet by ID
     - parameter petId: (path) ID of pet to return 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getPetById(petId: Int64, completion: @escaping ((_ data: Pet?, _ error: ErrorResponse?) -> Void)) {
        getPetByIdWithRequestBuilder(petId: petId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Find pet by ID
     - GET /pet/{petId}
     - Returns a single pet
     - API Key:
       - type: apiKey api_key 
       - name: api_key
     - examples: [{contentType=application/json, example={
  "part" : [ "", "" ],
  "name" : "doggie",
  "id" : 0,
  "status" : "available"
}}]
     - parameter petId: (path) ID of pet to return 
     - returns: RequestBuilder<Pet> 
     */
    open class func getPetByIdWithRequestBuilder(petId: Int64) -> RequestBuilder<Pet> {
        var path = "/pet/{petId}"
        let petIdPreEscape = "\(petId)"
        let petIdPostEscape = petIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{petId}", with: petIdPostEscape, options: .literal, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Pet>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     update parrots
     - parameter body: (body)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateParrots(body: Body1? = nil, completion: @escaping ((_ data: InlineResponse200?, _ error: ErrorResponse?) -> Void)) {
        updateParrotsWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     update parrots
     - PUT /parrot

     - examples: [{contentType=application/json, example={
  "parrots" : [ "", "" ]
}}]
     - parameter body: (body)  (optional)
     - returns: RequestBuilder<InlineResponse200> 
     */
    open class func updateParrotsWithRequestBuilder(body: Body1? = nil) -> RequestBuilder<InlineResponse200> {
        let path = "/parrot"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters = body?.encodeToJSON()

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<InlineResponse200>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Update an existing pet
     - parameter body: (body) Pet object that needs to be added to the store 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updatePet(body: Pet, completion: @escaping ((_ error: ErrorResponse?) -> Void)) {
        updatePetWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(error)
        }
    }


    /**
     Update an existing pet
     - PUT /pet
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter body: (body) Pet object that needs to be added to the store 
     - returns: RequestBuilder<Void> 
     */
    open class func updatePetWithRequestBuilder(body: Pet) -> RequestBuilder<Void> {
        let path = "/pet"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters = body.encodeToJSON()

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Updates a pet in the store with form data
     - parameter petId: (path) ID of pet that needs to be updated 
     - parameter name: (form)  (optional)
     - parameter status: (form)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updatePetWithForm(petId: Int64, name: String? = nil, status: String? = nil, completion: @escaping ((_ error: ErrorResponse?) -> Void)) {
        updatePetWithFormWithRequestBuilder(petId: petId, name: name, status: status).execute { (response, error) -> Void in
            completion(error)
        }
    }


    /**
     Updates a pet in the store with form data
     - POST /pet/{petId}
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter petId: (path) ID of pet that needs to be updated 
     - parameter name: (form)  (optional)
     - parameter status: (form)  (optional)
     - returns: RequestBuilder<Void> 
     */
    open class func updatePetWithFormWithRequestBuilder(petId: Int64, name: String? = nil, status: String? = nil) -> RequestBuilder<Void> {
        var path = "/pet/{petId}"
        let petIdPreEscape = "\(petId)"
        let petIdPostEscape = petIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{petId}", with: petIdPostEscape, options: .literal, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        let formParams: [String:Any?] = [
                        "name": name,
                        "status": status
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     uploads an image
     - parameter petId: (path) ID of pet to update 
     - parameter body: (body)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func uploadFile(petId: Int64, body: Object? = nil, completion: @escaping ((_ data: ApiResponse?, _ error: ErrorResponse?) -> Void)) {
        uploadFileWithRequestBuilder(petId: petId, body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     uploads an image
     - POST /pet/{petId}/uploadImage
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - examples: [{contentType=application/json, example={
  "code" : 0,
  "type" : "type",
  "message" : "message"
}}]
     - parameter petId: (path) ID of pet to update 
     - parameter body: (body)  (optional)
     - returns: RequestBuilder<ApiResponse> 
     */
    open class func uploadFileWithRequestBuilder(petId: Int64, body: Object? = nil) -> RequestBuilder<ApiResponse> {
        var path = "/pet/{petId}/uploadImage"
        let petIdPreEscape = "\(petId)"
        let petIdPostEscape = petIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{petId}", with: petIdPostEscape, options: .literal, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        let parameters = body?.encodeToJSON()

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ApiResponse>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}

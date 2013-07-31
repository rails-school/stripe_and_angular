StrAng = angular.module('StrAng', [])

StrAng.controller "ChargeCtrl", ["$scope", "$http", ($scope, $http) ->
  $scope.card =
    number: "4242424242424242"
    expMonth: '12'
    expYear: '2015'
    cvc: '123'
  $scope.submitCard = (card) ->
    Stripe.createToken card, (status, response) ->
      if status is 200
        console.log response

        data = {}
        data.last4 = response.card.last4
        data.token = response.id

        #Send data to backend
        $http.post('/process_card', data).success( (response) ->
          console.log response
          if response.paid == true
            alert "You were charged #{response.amount - 20} bucks, buddy"
        )
      else
        $scope.message = response.error.message
        console.log response
        alert "no..."


]
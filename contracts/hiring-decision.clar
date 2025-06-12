;; Hiring Decision Contract
;; Manages final hiring decisions and offers

(define-constant ERR_UNAUTHORIZED (err u500))
(define-constant ERR_CANDIDATE_NOT_SCREENED (err u501))
(define-constant ERR_DECISION_EXISTS (err u502))
(define-constant ERR_INVALID_DECISION (err u503))

;; Data structures
(define-map hiring-decisions
  { candidate-id: uint }
  {
    decision: (string-ascii 20),
    decision-maker: principal,
    reasoning: (string-ascii 500),
    offer-amount: (optional uint),
    decision-date: uint,
    final: bool
  }
)

(define-map job-offers
  { candidate-id: uint }
  {
    position: (string-ascii 100),
    salary: uint,
    start-date: uint,
    offer-expiry: uint,
    status: (string-ascii 20),
    offered-by: principal
  }
)

;; Make hiring decision
(define-public (make-hiring-decision
  (candidate-id uint)
  (decision (string-ascii 20))
  (reasoning (string-ascii 500))
  (offer-amount (optional uint))
)
  (begin
    (asserts! (is-none (map-get? hiring-decisions { candidate-id: candidate-id })) ERR_DECISION_EXISTS)
    (asserts! (or (is-eq decision "hire") (is-eq decision "reject") (is-eq decision "pending")) ERR_INVALID_DECISION)

    (map-set hiring-decisions
      { candidate-id: candidate-id }
      {
        decision: decision,
        decision-maker: tx-sender,
        reasoning: reasoning,
        offer-amount: offer-amount,
        decision-date: block-height,
        final: (not (is-eq decision "pending"))
      }
    )
    (ok true)
  )
)

;; Create job offer
(define-public (create-job-offer
  (candidate-id uint)
  (position (string-ascii 100))
  (salary uint)
  (start-date uint)
  (offer-expiry uint)
)
  (begin
    ;; Check if candidate was hired
    (match (map-get? hiring-decisions { candidate-id: candidate-id })
      decision-data (begin
        (asserts! (is-eq (get decision decision-data) "hire") ERR_UNAUTHORIZED)
        (map-set job-offers
          { candidate-id: candidate-id }
          {
            position: position,
            salary: salary,
            start-date: start-date,
            offer-expiry: offer-expiry,
            status: "pending",
            offered-by: tx-sender
          }
        )
        (ok true)
      )
      ERR_CANDIDATE_NOT_SCREENED
    )
  )
)

;; Accept/reject job offer
(define-public (respond-to-offer (candidate-id uint) (response (string-ascii 20)))
  (match (map-get? job-offers { candidate-id: candidate-id })
    offer-data (begin
      (asserts! (or (is-eq response "accepted") (is-eq response "rejected")) ERR_INVALID_DECISION)
      (map-set job-offers
        { candidate-id: candidate-id }
        (merge offer-data { status: response })
      )
      (ok true)
    )
    ERR_CANDIDATE_NOT_SCREENED
  )
)

;; Get hiring decision
(define-read-only (get-hiring-decision (candidate-id uint))
  (map-get? hiring-decisions { candidate-id: candidate-id })
)

;; Get job offer
(define-read-only (get-job-offer (candidate-id uint))
  (map-get? job-offers { candidate-id: candidate-id })
)

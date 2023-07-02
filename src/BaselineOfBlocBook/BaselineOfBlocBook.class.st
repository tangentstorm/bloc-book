Class {
	#name : #BaselineOfBlocBook,
	#superclass : #BaselineOf,
	#category : #BaselineOfBlocBook
}

{ #category : #loading }
BaselineOfBlocBook class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'bloc-book' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfBlocBook >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'BlocBook'
		]
]

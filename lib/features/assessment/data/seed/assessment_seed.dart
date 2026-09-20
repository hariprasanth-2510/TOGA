import '../models/assessment_models.dart';

const assessmentSeed = <AssessmentQuestion>[
  AssessmentQuestion(
      id: 'vor-1',
      topic: 'VOR',
      subtopic: 'Radials',
      difficulty: 'Basic',
      text: 'A VOR radial is measured:',
      options: [
        'From the station',
        'To the station',
        'From true north only',
        'From the aircraft nose'
      ],
      correctOptionIndex: 0,
      explanation: 'Radials extend outward from the VOR station.',
      learningUnitTitle: 'VOR Principles'),
  AssessmentQuestion(
      id: 'vor-2',
      topic: 'VOR',
      subtopic: 'Reference',
      difficulty: 'Basic',
      text: 'VOR radials are referenced to:',
      options: [
        'Magnetic north',
        'True north',
        'Grid north',
        'Aircraft heading'
      ],
      correctOptionIndex: 0,
      explanation: 'Conventional VOR radials use magnetic reference.',
      learningUnitTitle: 'VOR Principles'),
  AssessmentQuestion(
      id: 'vor-3',
      topic: 'VOR',
      subtopic: 'TO/FROM',
      difficulty: 'Intermediate',
      text:
          'The TO/FROM indication helps identify whether the selected course leads:',
      options: [
        'Toward or away from the station',
        'Above or below the glidepath',
        'Left or right of runway',
        'Faster or slower'
      ],
      correctOptionIndex: 0,
      explanation:
          'It describes the relationship of the selected course to the VOR station.',
      learningUnitTitle: 'Radials & Bearings'),
  AssessmentQuestion(
      id: 'vor-4',
      topic: 'VOR',
      subtopic: 'Course',
      difficulty: 'Intermediate',
      text: 'To fly inbound on the 090 radial, the approximate course is:',
      options: ['270 degrees', '090 degrees', '180 degrees', '360 degrees'],
      correctOptionIndex: 0,
      explanation: 'An inbound course is reciprocal to the outbound radial.',
      learningUnitTitle: 'Radials & Bearings'),
  AssessmentQuestion(
      id: 'vor-5',
      topic: 'VOR',
      subtopic: 'Limits',
      difficulty: 'Basic',
      text: 'VOR is a:',
      options: [
        'VHF radio-navigation system',
        'Satellite-only system',
        'Distance-only system',
        'Weather radar system'
      ],
      correctOptionIndex: 0,
      explanation: 'VOR means VHF Omnidirectional Range.',
      learningUnitTitle: 'VOR Principles'),
  AssessmentQuestion(
      id: 'dme-1',
      topic: 'DME',
      subtopic: 'Distance',
      difficulty: 'Basic',
      text: 'DME primarily provides:',
      options: [
        'Slant-range distance',
        'Magnetic bearing',
        'Wind velocity',
        'Ground track'
      ],
      correctOptionIndex: 0,
      explanation: 'DME measures slant range to a compatible station.',
      learningUnitTitle: 'DME'),
  AssessmentQuestion(
      id: 'dme-2',
      topic: 'DME',
      subtopic: 'Geometry',
      difficulty: 'Intermediate',
      text:
          'Directly above a DME station, indicated distance is approximately:',
      options: [
        'Aircraft height above the station',
        'Zero at every altitude',
        'Ground distance travelled',
        'The selected radial'
      ],
      correctOptionIndex: 0,
      explanation: 'Slant range is largely vertical when overhead.',
      learningUnitTitle: 'DME'),
  AssessmentQuestion(
      id: 'dme-3',
      topic: 'DME',
      subtopic: 'Geometry',
      difficulty: 'Basic',
      text:
          'At high altitude close to a station, DME may differ from map distance because it measures:',
      options: [
        'Slant range',
        'Wind-corrected range',
        'Time range',
        'Magnetic range'
      ],
      correctOptionIndex: 0,
      explanation: 'The line of sight is longer than horizontal distance.',
      learningUnitTitle: 'DME'),
  AssessmentQuestion(
      id: 'dme-4',
      topic: 'DME',
      subtopic: 'Equipment',
      difficulty: 'Basic',
      text: 'DME requires:',
      options: [
        'A compatible ground station',
        'A GPS waypoint only',
        'A compass card',
        'An ILS localizer only'
      ],
      correctOptionIndex: 0,
      explanation:
          'The airborne interrogator exchanges signals with compatible ground equipment.',
      learningUnitTitle: 'DME'),
  AssessmentQuestion(
      id: 'dme-5',
      topic: 'DME',
      subtopic: 'Use',
      difficulty: 'Intermediate',
      text: 'A useful DME cross-check during navigation is:',
      options: [
        'Expected distance at a known point',
        'Cabin temperature',
        'Fuel colour',
        'Runway lighting'
      ],
      correctOptionIndex: 0,
      explanation: 'Expected distance helps validate position awareness.',
      learningUnitTitle: 'DME'),
  AssessmentQuestion(
      id: 'intercept-1',
      topic: 'Interception',
      subtopic: 'Purpose',
      difficulty: 'Basic',
      text: 'Course interception is used to:',
      options: [
        'Join a selected course',
        'Measure distance',
        'Change VOR frequency automatically',
        'Set aircraft altitude'
      ],
      correctOptionIndex: 0,
      explanation:
          'Interception establishes the aircraft on the desired course.',
      learningUnitTitle: 'Interception'),
  AssessmentQuestion(
      id: 'intercept-2',
      topic: 'Interception',
      subtopic: 'Angle',
      difficulty: 'Intermediate',
      text: 'A larger intercept angle generally produces a:',
      options: [
        'Faster course capture',
        'Slower radio signal',
        'Lower station elevation',
        'Different DME frequency'
      ],
      correctOptionIndex: 0,
      explanation: 'A larger angle closes lateral deviation more quickly.',
      learningUnitTitle: 'Interception'),
  AssessmentQuestion(
      id: 'intercept-3',
      topic: 'Interception',
      subtopic: 'Correction',
      difficulty: 'Intermediate',
      text:
          'As the desired course is approached during interception, the pilot should:',
      options: [
        'Reduce the intercept angle',
        'Increase it continuously',
        'Ignore CDI movement',
        'Turn off the receiver'
      ],
      correctOptionIndex: 0,
      explanation: 'Reducing the angle avoids overshooting the course.',
      learningUnitTitle: 'Interception'),
  AssessmentQuestion(
      id: 'intercept-4',
      topic: 'Interception',
      subtopic: 'CDI',
      difficulty: 'Basic',
      text: 'The CDI is used during interception to show:',
      options: [
        'Course deviation',
        'Fuel remaining',
        'Distance to destination',
        'Engine temperature'
      ],
      correctOptionIndex: 0,
      explanation:
          'The course deviation indicator shows lateral displacement from the selected course.',
      learningUnitTitle: 'Interception'),
  AssessmentQuestion(
      id: 'intercept-5',
      topic: 'Interception',
      subtopic: 'Planning',
      difficulty: 'Basic',
      text: 'An intercept should be planned considering:',
      options: [
        'Position and desired course',
        'Only cabin pressure',
        'Only aircraft colour',
        'Only elapsed time'
      ],
      correctOptionIndex: 0,
      explanation:
          'The current position relative to the target course determines the manoeuvre.',
      learningUnitTitle: 'Interception'),
  AssessmentQuestion(
      id: 'track-1',
      topic: 'Tracking',
      subtopic: 'Purpose',
      difficulty: 'Basic',
      text: 'Tracking means:',
      options: [
        'Maintaining a desired course',
        'Initially joining a course',
        'Measuring slant range',
        'Changing a radio frequency'
      ],
      correctOptionIndex: 0,
      explanation:
          'Tracking follows interception and keeps the aircraft on course.',
      learningUnitTitle: 'Tracking'),
  AssessmentQuestion(
      id: 'track-2',
      topic: 'Tracking',
      subtopic: 'Wind',
      difficulty: 'Intermediate',
      text: 'Wind correction while tracking is used to counter:',
      options: ['Drift', 'DME delay', 'Station elevation', 'Radio volume'],
      correctOptionIndex: 0,
      explanation:
          'Wind moves the aircraft away from the desired ground track.',
      learningUnitTitle: 'Tracking'),
  AssessmentQuestion(
      id: 'track-3',
      topic: 'Tracking',
      subtopic: 'CDI',
      difficulty: 'Basic',
      text: 'A stable CDI near centre while tracking normally indicates:',
      options: [
        'The selected course is being maintained',
        'DME is unavailable',
        'The station is off-air',
        'The aircraft is stationary'
      ],
      correctOptionIndex: 0,
      explanation: 'A centred CDI indicates little lateral deviation.',
      learningUnitTitle: 'Tracking'),
  AssessmentQuestion(
      id: 'track-4',
      topic: 'Tracking',
      subtopic: 'Correction',
      difficulty: 'Intermediate',
      text: 'After correcting a tracking deviation, the pilot should:',
      options: [
        'Reassess and avoid overcorrection',
        'Maintain maximum bank',
        'Stop monitoring the CDI',
        'Change to an unrelated radial'
      ],
      correctOptionIndex: 0,
      explanation:
          'Small, monitored corrections prevent oscillation around the course.',
      learningUnitTitle: 'Tracking'),
  AssessmentQuestion(
      id: 'track-5',
      topic: 'Tracking',
      subtopic: 'Sequence',
      difficulty: 'Basic',
      text: 'The normal sequence is:',
      options: [
        'Intercept, then track',
        'Track, then intercept',
        'DME, then intercept only',
        'Descend, then tune'
      ],
      correctOptionIndex: 0,
      explanation: 'First establish the course, then maintain it.',
      learningUnitTitle: 'Tracking'),
];
